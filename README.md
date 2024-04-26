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

### Step 1: Resume/CV Upload and Analysis
- **Applicant**: Uploads their resume/CV.
- **Recruiter**: Receives and extracts the resume/CV data, viewing conclusions on their dashboard.

### Step 2: Job Role Specification
- **Recruiter**: Specifies the job role for evaluation, assigning the `{role}` variable.

### Step 3: Large Language Model (LLM) Analysis
- **Analysis**: The extracted resume/CV and job role are analyzed using the `gpt-3.5-turbo-0125` model to derive a preliminary conclusion.

### Step 4: Initial Screening Decision
- **Decision**: Based on the LLM's analysis, recruiters decide whether to advance the candidate to the phone interview stage.

### Step 5: Phone Interview
- **Interview**: Conducts a tailored phone interview if the candidate's initial screening is successful.

### Step 6: Final Evaluation
- **Conclusion**: The interview transcript is analyzed by the LLM to finalize the candidate's suitability for the position.

## License

This project is open-sourced under the MIT License.
