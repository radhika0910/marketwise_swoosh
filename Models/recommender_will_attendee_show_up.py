import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer
import re
import string
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
from nltk import word_tokenize
import nltk

# Download NLTK data if needed
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

# Read employee and events data
df = pd.read_csv('C:/Users/vivek/Desktophavckathon\Radhika\EmployeeDataset.csv')
events = pd.read_csv('events.csv')

# Data preprocessing
# Remove NaN values
df.dropna(inplace=True)

# Lowercase and remove spaces from domain and events columns
df["Domain"] = df["Domain"].str.lower().str.replace(' ', '')
df["Event1"] = df["Event1"].str.lower().str.replace(' ', '')
df["Event2"] = df["Event2"].str.lower().str.replace(' ', '')

# Create bag of words for each employee
df['Bag_of_words'] = df.apply(lambda row: ' '.join(row[col] for col in ['Domain', 'Event1', 'Event2']), axis=1)

# Clean text function
stop_words_ = set(stopwords.words('english'))
wn = WordNetLemmatizer()

def clean_text(text):
    """
    Function to clean text data by removing special characters, numbers, stopwords, and lemmatizing words.

    Parameters:
    - text: Input text data to be cleaned.

    Returns:
    - clean_text: Cleaned text data.
    """
    text = re.sub("'", "", text)
    text = re.sub("(\\d|\\W)+", " ", text)
    text = text.replace("nbsp", "")
    clean_text = [wn.lemmatize(word, pos="v") for word in word_tokenize(text.lower()) if word not in stop_words_ and word not in list(string.punctuation) and len(word) > 2]
    return " ".join(clean_text)

df['Bag_of_words'] = df['Bag_of_words'].apply(clean_text)

# Calculate cosine similarity
count = CountVectorizer()
count_matrix = count.fit_transform(df['Bag_of_words'])
cosine_sim = cosine_similarity(count_matrix, count_matrix)

# Define recommendation function
def recommend_events(input_event, cosine_sim=cosine_sim, events=events):
    """
    Function to recommend events based on input event using cosine similarity.

    Parameters:
    - input_event: The input event for which recommendations are needed.
    - cosine_sim: Cosine similarity matrix between events.
    - events: DataFrame containing events data.

    Returns:
    - recommended_employees: List of recommended employees for the input event.
    """
    idx = events[events['events'] == input_event].index[0]
    score_series = pd.Series(cosine_sim[idx]).sort_values(ascending=False)
    similar_indices = list(score_series.iloc[1:6].index)  # Exclude itself, take top 5 similar employees
    recommended_employees = df.iloc[similar_indices]['Name'].tolist()
    return recommended_employees

# Input event
input_event = input("Enter the event name: ")

# Get recommended employees for the input event
recommended_employees = recommend_events(input_event)

# Create DataFrame with output
output_df = pd.DataFrame({'Employee': recommended_employees, 'Recommended_Event': input_event})
print(output_df)

# Export DataFrame to Excel
output_file = "recommended_events.xlsx"
output_df.to_excel(output_file, index=False)
print(f"Output saved to {output_file}")
