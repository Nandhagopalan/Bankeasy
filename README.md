# Bankeasy

Bankeasy is a project that aims to simplify the process of approval of cheques and making it easier for both bank officials and customers.

This project leverages Donut model proposed in the paper <a href="https://arxiv.org/abs/2111.15664/"> OCR-free Document Understanding Transformer </a> for the parsing of the required data from cheques.'

## Donut
Donut is based on a very simple transformer encoder and decoder architecture. It's main use is that it is an OCR-free approach to Visual Document Understanding (VDU) and can perform tasks like document classification, information extraction as well as VQA.


OCR based techniques come with several limitations such as requiring use of additional downstream models, lack of understanding about document structure, requiring use of hand crafted rules for information extraction,etc. \

Donut helps you get rid of all of these OCR specific limitations. The model for the project has been trained using a subset of this  

<a href="https://www.kaggle.com/datasets/medali1992/cheque-images/"> kaggle dataset </a>. The original dataset contains images of cheques of 10 different banks.

## HF Space 🤗: 
https://huggingface.co/spaces/Nandhu/DocAI 🍩


## Acknowledgements

I would like to thank Kaggle community as a whole for providing an avenue to learn and discuss latest data science/machine learning advancements.

1. Shivalika Singh for her overall pipeline for this project ["ChequeEasy"](https://medium.com/@shivalikasingh95/chequeeasy-banking-with-transformers-f49fb05960d3)

2. Finetuning of donut model using trainer API [Donut_finetuning](https://www.philschmid.de/fine-tuning-donut) for the beautiful blog on donut finetuning using trainer API.
