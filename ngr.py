import requests
import json
url = "https://1e30-103-4-220-252.ngrok-free.app/evaluate"
data = {
    'role': 'data analyst',
    'information': '''SHIVAM UMANG MITTER
♂phone+91 6267702526 /envel⌢peshivammitter1@gmail.com /linkedinlinkedin.com/in/shivamumangmitter /githubgithub.com/mavihsrr
Education
Bachelor of Technology in Computer Science SRM Institute of Science and Technology, 2021-2025
Chennai, Tamil NaduCurrent CGPA - 9.78
Technical Skills
Languages : Python, C,C++, HTML, SQL
Developer Tools : VS Code, Power BI, Jupyter Notebook, GitHub, LangChain
AI/ML : Tensorflow, Scikit-learn, Pandas, Numpy, NLP, LLM
Experience
Master Control Facility, ISRO June 2023 – July 2023
Software Engineer Intern Bhopal, Madhya Pradesh
•Developed a NLP-based model for error detection and warnings in system logs within a Linux-based environment,
enhancing system reliability and troubleshooting efficiency.
•Created a voice-activated local search engine with a 90% accuracy rate, enhancing user accessibility for local information
and services.
Waveform Labs January 2023 – March 2023
Technical Content Writer Chennai, Tamil Nadu
•Curated and published technical content, providing valuable resources and knowledge for external audiences.
•Worked with a team of 3 to author and publish technical blogs on Medium, reaching over 100 readers.
•Optimized SEO efforts, increasing organic traffic by 40% and driving a 15% boost in platform’s audience engagement and
conversion rates.
Projects
MoodMinder |Q-NLP, AI/ML,OpenCV, Flask August 2023
•Collaborated with a team of 4 to implement Real-Time Behavior Authentication & Quantum Mood Tracking for
Employee Engagement.
•Collects feedback from users. Generates reviews for administrators based on user feedback.
•Utilized computer vision to capture user pictures and classify emotions.
•Connected ChatGPT with OpenAI’s API to help administrators with practical insights and solutions.
Curricular |Python, Machine Learning, Streamlit January 2023
•Led a team of 4 in execut
'''
}
headers = {"Content-Type": "application/json"}
response = requests.post(url, headers=headers, data=json.dumps(data))
print(response.text)