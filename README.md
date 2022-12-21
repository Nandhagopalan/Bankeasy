# Chequeeasy

ChequeEasy is a project that aims to simplify the process of approval of cheques and making it easier for both bank officials and customers.

This project leverages Donut model proposed in the paper <a href="https://arxiv.org/abs/2111.15664/"> OCR-free Document Understanding Transformer </a> for the parsing of the required data from cheques.'

'Donut is based on a very simple transformer encoder and decoder architecture. It\'s main USP is that it is an OCR-free approach to Visual Document Understanding (VDU) and can perform tasks like document classification, information extraction as well as VQA. \


OCR based techniques come with several limitations such as requiring use of additional downstream models, lack of understanding about document structure, requiring use of hand crafted rules for information extraction,etc. \
Donut helps you get rid of all of these OCR specific limitations. The model for the project has been trained using a subset of this  <a href="https://www.kaggle.com/datasets/medali1992/cheque-images/"> kaggle dataset </a>. The original dataset contains images of cheques of 10 different banks.