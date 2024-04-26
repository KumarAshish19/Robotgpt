import requests
import requests


def calling():

    url = "https://api.bland.ai/v1/calls"
    payload = {
        "phone_number": "+916267702526",
        "task": """The main objective of this phone interview is to gather 
        additional information about the candidate who has been shortlisted 
        based on their resume. The goal is to assess the candidate's 
        qualifications, experiences, and overall suitability for the job role.Only ask 3 or minimal questions. If the user asks anything related to the 
        company or the job role, simply say that the the organisation is a AI based consultancy firm having us based clients. Dont dive deeper into questions. 
        Simply ask and move on""",
        "first_sentence": """Hello, I'm calling from Hire.AI regarding
          the application you expressed interest in. Could you 
          confirm if this is a convenient time to speak?""",
        "wait_for_greeting": True,
        "model": "base",
        "tools": [],
        "record": True,
        "voice_settings": {},
        "language": "eng",
        "answered_by_enabled": True,
        "temperature": 0,
        "amd": False,
    }
    headers = {
        "authorization": "sk-zkic20236xlh90oguo8fek0aclmpnrv0t8youl8yc8lt0lkvnniffsmzlyd8yhul69",
        "Content-Type": "application/json",
    }
    response = requests.request("POST", url, json=payload, headers=headers)
    response_json = response.json()
    print(response_json.get("message", ""))
calling()