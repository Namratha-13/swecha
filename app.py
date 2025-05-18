import streamlit as st 
import numpy as np 
import pandas as pd 
 
st.title("SOAI 2025 Project: Data Dashboard") 
st.write("This is a simple dashboard using the SOAI 2025 tech stack.") 
 
# Create a sample dataset with NumPy and Pandas
np.random.seed(42) 
data = np.random.randn(10, 3) 
df = pd.DataFrame(data, columns=["A", "B", "C"]) 
st.write("Sample Dataset:", df) 
 
# Add a simple calculation 
mean_values = df.mean() 
st.write("Mean Values of Each Column:", mean_values) 
