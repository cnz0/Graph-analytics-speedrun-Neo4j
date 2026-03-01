import pandas as pd
import os 

def remove_columns(input_file, output_file, columns_to_remove):
    df = pd.read_csv(input_file)

    df.drop(columns=columns_to_remove, inplace=True)

    df.to_csv(output_file, index=False)

remove_columns('categories-data.csv', 'categories-data-dropped.csv',['rules'])