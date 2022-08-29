import firebase_admin
from firebase_admin import credentials


def get_credentials():
    cred = credentials.Certificate('firebase.json')
    return firebase_admin.initialize_app(cred)
