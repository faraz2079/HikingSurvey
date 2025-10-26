***App Screenshot:*** 

<img width="352" height="769" alt="Screenshot 2025-10-26 at 9 05 52 PM" src="https://github.com/user-attachments/assets/ba0da14c-4e37-4fda-8f52-89c15d1d4ea9" />






✨ Features

	•	🗣️ User Input Collection – Users can freely enter their opinions about hiking in a multiline text field.
	•	🧠 On-device Sentiment Analysis – Each response is processed locally using NLTagger(.sentimentScore) from the NaturalLanguage framework to generate a sentiment score between −1 (negative) and +1 (positive).
	•	🎨 Visual Feedback – Every response is displayed with a colored sentiment icon (positive, moderate, negative) based on its computed score.
	•	📊 Data Visualization – A donut chart summarizes the overall sentiment distribution across all responses using Swift Charts.
	•	💾 Local Persistence – Responses and their sentiment scores are saved as a JSON file in the app’s Documents directory. Data automatically reloads when the app launches, so entries persist between sessions.
	•	⌨️ Clean UI Experience – Uses @FocusState to manage the keyboard state and dismiss it after submitting text.
	•	🧱 Reusable Components – The UI is modular, with separate SwiftUI views for ResponseView (individual items) and ChartView (aggregated sentiments).


⚙️ How It Works

	1.	The user types a sentence or paragraph about hiking.
	2.	When Done is tapped, the app:
	•	Runs the text through the Scorer class (NLTagger) to compute a sentiment score.
	•	Creates a new Response object containing the text and its score.
	•	Saves the updated array of responses to a local JSON file via ResponseStore.
	3.	On launch, the app loads all saved responses from disk.
	4.	The main screen shows:
	•	A ChartView donut chart displaying overall sentiment distribution.
	•	A scrollable list of individual responses, each styled according to its sentiment.

All analysis and storage happen on-device, ensuring privacy and offline functionality.


Technologies Used and Their Purpose: 

SwiftUI: Declarative UI framework

Natural Language: Sentiment analysis via NLTagger

Swift Charts: Data visualization for sentiment distribution

Foundation: JSON encoding / decoding (Codable)

Concurrency / DispatchQueue: Background file IO for saving and loading

@FocusState: Keyboard focus management


🚀 Running the App

	1.	Open the project in Xcode 14 or later.
	2.	Build & run on iOS 16 or later (Simulator or device).
	3.	Type your hiking opinion → tap Done → view instant sentiment feedback and chart updates.


  Hiking Survey demonstrates how to combine Natural Language Processing, data visualization, and local persistence in a clean, modern SwiftUI app — all while keeping user data private and offline.






