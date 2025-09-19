import requests
import time

url = "http://10.42.141.99/a1/hijack_session"

while True:
    try:
        response = requests.get(url, timeout=5)
        session_value = None

        # Check if the cookie contains hijack_session
        if response.cookies.get("hijack_session"):
            session_value = response.cookies.get("hijack_session")

        # Check if the response text contains hijack_session
        elif "hijack_session" in response.text:
            start = response.text.find("hijack_session")
            session_value = response.text[start:start + 50]

        if session_value:
            print(f"[Session] hijack_session = {session_value}")
        else:
            print("[-] No hijack_session found")

    except requests.exceptions.RequestException as e:
        print("[-] Error:", e)

    time.sleep(3)
