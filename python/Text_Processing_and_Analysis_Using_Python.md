# Text Processing and Analysis
A brief introduction to Text Processing and Analysis using Python.

### 1. Collect Data
- Use existing datasets
    1. direct download
    2. via API
- Scrape website

### 2. Pre-process Data
- Remove unneeded data
    1. remove HTML tags
    2. remove other unneeded parts
- Deal with encoding issues
- Tokenize document(s)
    1. document(s) --> sentences
    2. sentences --> words
- POS tag words (via nltk)
    1. convert to lower case words
    2. remove punctuation
    3. spellcheck (<http://pythonhosted.org/pyenchant/>)
    4. remove stopwords (<http://stackoverflow.com/questions/19130512/stopword-removal-with-nltk>)
    5. lemmatize/stem words (<http://www.nltk.org/api/nltk.stem.html>)

### 3. Bag-of-words (https://en.wikipedia.org/wiki/Bag-of-words_model)
- Scikit.learn (http://scikit-learn.org/stable/modules/feature_extraction.html#limitations-of-the-bag-of-words-representation)

### 4. TF-IDF
- Scikit.learn (<http://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.TfidfVectorizer.html>)

### 5. Training models (http://scikit-learn.org/stable/supervised_learning.html)
- Classification
- Sentiment analysis
- Topic Extraction 
    1. topics_extraction_with_nmf (<http://scikit-learn.org/0.16/auto_examples/applications/topics_extraction_with_nmf.html>)
    2. LDA (<http://radimrehurek.com/gensim/wiki.html#latent-dirichlet-allocation>)
    3. word2vec (<http://radimrehurek.com/gensim/models/word2vec.html>)
- ...

### 6. Visualization
- Matplotlib (<http://matplotlib.org/>)
- Tag cloud: self-develop or find one in github
- ...
        

