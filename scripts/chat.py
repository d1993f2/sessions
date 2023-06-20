#!/usr/bin/python3

import os

from llama_index import SimpleDirectoryReader, GPTVectorStoreIndex, ServiceContext, LLMPredictor, StorageContext, load_index_from_storage
from langchain.chat_models import ChatOpenAI


chapters_directory = "../chapters"
persist_directory = "../.chat"


def make_service_context():
  llm_predictor = LLMPredictor(llm=ChatOpenAI(model_name='gpt-3.5-turbo', temperature=0))
  return ServiceContext.from_defaults(llm_predictor=llm_predictor)


def build_index(source_directory, storage_directory):
  print("Indexing...")
  documents = SimpleDirectoryReader(source_directory).load_data()

  index = GPTVectorStoreIndex.from_documents(documents, service_context=make_service_context())
  index.storage_context.persist(persist_dir=storage_directory)

  return index


def load_index(storage_directory):
  storage_context = StorageContext.from_defaults(persist_dir=storage_directory)
  index = load_index_from_storage(storage_context, service_context=make_service_context())
  return index


def build_or_load_index(source_directory, storage_directory):
  if os.path.exists(storage_directory):
    return load_index(storage_directory)
  else:
    return build_index(source_directory, storage_directory)
  
  
index = build_or_load_index(chapters_directory, persist_directory)

while True:
  query=input("Ask: ")
  print(index.as_query_engine().query(query).response, "\n")
