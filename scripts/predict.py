from utils.donut_utils import (
    load_donut_model_and_processor,
    prepare_data_using_processor,
    load_image,
)
import re

CHEQUE_PARSER_MODEL = "Nandhu/DocAI"
TASK_PROMPT = "<s>"


def parse_cheque_with_donut(input_image_path):

    image = load_image(input_image_path)

    donut_processor, model = load_donut_model_and_processor(CHEQUE_PARSER_MODEL)

    cheque_image_tensor, input_for_decoder = prepare_data_using_processor(
        donut_processor, image, TASK_PROMPT
    )

    outputs = model.generate(
        cheque_image_tensor,
        decoder_input_ids=input_for_decoder,
        max_length=model.decoder.config.max_position_embeddings,
        early_stopping=True,
        pad_token_id=donut_processor.tokenizer.pad_token_id,
        eos_token_id=donut_processor.tokenizer.eos_token_id,
        use_cache=True,
        num_beams=1,
        bad_words_ids=[[donut_processor.tokenizer.unk_token_id]],
        return_dict_in_generate=True,
        output_scores=True,
    )

    decoded_output_sequence = donut_processor.batch_decode(outputs.sequences)[0]

    extracted_cheque_details = decoded_output_sequence.replace(
        donut_processor.tokenizer.eos_token, ""
    ).replace(donut_processor.tokenizer.pad_token, "")

    ## remove task prompt from token sequence
    cleaned_cheque_details = re.sub(
        r"<.*?>", "", extracted_cheque_details, count=1
    ).strip()

    ## generate ordered json sequence from output token sequence
    cheque_details_json = donut_processor.token2json(cleaned_cheque_details)
    print("cheque_details_json:", cheque_details_json)

    ## extract required fields from predicted json

    amt_in_words = cheque_details_json["VALUE_LETTERS"]
    amt_in_figures = cheque_details_json["VALUE_NUMBERS"]

    payee_name = cheque_details_json["USER2NAME"]

    bank_name = cheque_details_json["BANK_NAME"]

    return (payee_name, amt_in_words, amt_in_figures, bank_name)
