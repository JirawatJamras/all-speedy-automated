from pymongo import MongoClient


class MongoDBLibrary:
    def __init__(self, uri=None, database=None, collection=None):
        self.client = None
        self.database = None
        self.collection = None
        if uri and database and collection:
            self.connect_to_mongodb(uri, database, collection)

    def connect_to_mongodb(self, uri, database, collection):
        self.client = MongoClient(uri, tls=True, tlsAllowInvalidCertificates=True)
        self.database = self.client[database]
        self.collection = self.database[collection]

    def update_document(self, query, update):
        if self.collection is None:
            raise Exception("Collection is not set")
        return self.collection.update_one(query, {"$set": update})

    def delete_document(self, query={}):
        if self.collection is None:
            raise Exception("Collection is not set")
        return self.collection.delete_one(query)

    def disconnect(self):
        if self.client:
            self.client.close()
            self.client = None
            self.database = None
            self.collection = None
