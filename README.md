# KBA-Medical-System
In this project, we designed and implemented a Knowledge-Based System (KBS) in Prolog to automate medical triage for basic consultations. The system is capable of diagnosing various medical conditions based on patient symptoms and suggesting appropriate treatments, using logic-based reasoning and rule-based decision-making.

## The process involved:
 1. Defining Diseases and Symptoms: We modeled a range of medical conditions (e.g., bronchitis, diabetes, cardiovascular diseases) along with their associated symptoms. Using Prolog's logical inference engine, the system matches a patient’s symptoms to these predefined diseases.
 2. Rule-Based Diagnosis: The system asks a series of questions based on a patient’s symptoms. Through a backward chaining approach, it applies medical rules to identify the most probable diagnosis and suggests relevant treatments, such as medication or lifestyle changes.
 3. Treatment Recommendations: For each diagnosis, the system cross-references patient conditions (e.g., allergies or contraindications) to recommend safe medications or alternative treatments.

## Key technical aspects:
 
 • Knowledge Representation: Diseases and symptoms were encoded as facts in Prolog, while decision rules were formulated as logical conditions. The use of recursive queries allowed the system to efficiently narrow down potential diagnoses.

 • Inference Mechanism: The project utilized Prolog’s inference engine to simulate expert-level decision-making, delivering consistent and reliable medical advice.
 
 • Scalability: This logic-based system can be expanded to handle more complex diagnoses and integrate with machine learning models to improve accuracy over time.

This project showcased the power of logic programming in developing intelligent systems for real-world applications, and it underscored the potential of Prolog in the healthcare domain.

Tools: Prolog Key Areas: Logic Programming, Knowledge-Based Systems, AI in Healthcare, Prolog, Automation, Expert Systems
