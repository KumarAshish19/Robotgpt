from flask import Flask, request
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
app = Flask(__name__)

load_dotenv()

@app.route('/evaluate', methods=['POST'])
def evaluate():
    data = request.get_json()
    role = data.get('role')
    information = data.get('information')

    return final(role, information)

def final(role, information):
    summary_template ="""

Resume Summary and Suitability Evaluation for the {role} Role 📋

#### Instructions for Analysis:
- **Extract Skills and Experiences**: From the {information} provided in the resume, detail only those skills and experiences that are explicitly related to the role {role}.

- **Identify Relevant Passions/Activities**: Document any passions or extracurricular activities that are strictly relevant to the {role}.

#### Verification of Relevance:
- **Relevance Check**: Directly compare the candidate’s skills and experiences against the job description for the {role}. Only consider candidates whose skills and experiences are a direct enhancement to their potential performance in the role.

#### Conclusion on Suitability 📇
- **Determine Suitability**:
  - If there is a direct and undeniable alignment between the candidate's skills and experiences and the {role}, classify them as a "GOOD FIT" and proceed to generate interview questions.
  - If the candidate's skills and experiences do not directly align with the {role}, classify them as "NOT A GOOD FIT" and conclude the analysis by stating a clear rejection without generating any interview questions.

#### Interview Preparation Questions (Conditional) 👇
- **Tailored Questions**: If the candidate is a good fit, generate three specific interview questions that probe deeper into the candidate's qualifications and relevance to the {role}. Do not generate questions if the candidate is not a good fit.

#### Candidate Contact Information
- **Phone Number Extraction**: Extract and display the candidate's phone number in the format "+[country code][phone number]", verifying its accuracy from the resume."""
    summary_prompt = PromptTemplate(
        input_variables=["information", "role"],
       template =summary_template
    )
    llm = ChatOpenAI(model="gpt-3.5-turbo-0125", temperature=0.5)
    chain = LLMChain(llm=llm, prompt=summary_prompt)
    result = chain.invoke(input={"information": information, "role": role})
    lines = result["text"].split('\n')
    phone_no = lines[-1].split(':')[-1].strip()
    summary = result["text"]
    return summary

if __name__ == '__main__':
    app.run(debug=True)