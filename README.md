# Hire.AI

## Overview

This project enhances recruitment processes by integrating GPT-3.5 to automate resume screening, phone interviews, and overall candidate assessment. By incorporating AI, we aim to increase efficiency and elevate the quality of hires in today's dynamic recruitment landscape.

## Key Features

- **AI-Powered Resume Screening**: Analyzes resumes using the GPT-3.5 model to summarize and generate initial screening questions.
  
- **Automated Phone Interviews**: Conducts AI-driven phone interviews that adapt to each candidate. Recordings and transcripts are analyzed to refine candidate evaluations.

- **Interactive Chatbots**: Employs AI chatbots to answer candidate inquiries in real time, improving engagement and experience during the recruitment process.

- **Personalized Candidate Recommendations**: Utilizes AI to match candidates with personalized job opportunities based on their profiles and preferences.

- **Onboarding and Training Plans**: Identifies skill gaps in new hires and suggests customized training plans to facilitate efficient onboarding.

## Usage

This system includes two dashboards: one for applicants and another for recruiters.
<img width="509" alt="Screenshot 2024-04-26 at 11 54 23 AM" src="https://github.com/KumarAshish19/Robotgpt/assets/91791239/e4424cb1-66a5-4207-af5a-b80144fb4f80">

### Step 1: Resume/CV Upload and Analysis
- **Applicant**: Uploads their resume/CV.
- **Recruiter**: Receives and extracts the resume/CV data, viewing conclusions on their dashboard.

### Step 2: Job Role Specification
- **Recruiter**: Specifies the job role for evaluation, assigning the `{role}` variable.

### Step 3: Large Language Model (LLM) Analysis
- **Analysis**: The extracted resume/CV and job role are analyzed using the `gpt-3.5-turbo-0125` model to derive a preliminary conclusion.

### Step 4: Initial Screening Decision
- **Decision**: Based on the LLM's analysis, recruiters decide whether to advance the candidate to the phone interview stage.

<img width="1110" alt="Screenshot 2024-04-26 at 11 59 55 AM" src="https://github.com/KumarAshish19/Robotgpt/assets/91791239/7bbeb6a0-a785-415d-92e4-9803fcfeda68">

### Step 6: Automates mail using Zapier
- Candidates who pass the initial screening will automatically receive an email detailing their scheduled phone interview times, coordinated through AI-driven assessments.
<img width="1106" alt="Screenshot 2024-04-26 at 12 00 06 PM" src="https://github.com/KumarAshish19/Robotgpt/assets/91791239/5d18eaaf-8559-49c8-b47c-e962dc4768ff">

### Step 5: Phone Interview
- **Interview**: Conducts a tailored phone interview if the candidate's initial screening is successful.

### Step 6: Final Evaluation
- **Conclusion**: The interview transcript is analyzed by the LLM to finalize the candidate's suitability for the position.

## License

This project is open-sourced under the MIT License.
