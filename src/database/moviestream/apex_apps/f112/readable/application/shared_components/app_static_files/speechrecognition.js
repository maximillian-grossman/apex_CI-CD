if ("webkitSpeechRecognition" in window) {
  // Initialize webkitSpeechRecognition
  let speechRecognition = new webkitSpeechRecognition();
  let recording = false;
  // String for the Final Transcript
  let final_transcript = "";

  // Set the properties for the Speech Recognition object
  speechRecognition.continuous = true;
  speechRecognition.interimResults = true;
  speechRecognition.lang = "en-US";

  // Callback Function for the onStart Event
  speechRecognition.onstart = () => {
    // Show the Status Element
   
  };
  speechRecognition.onerror = () => {
    // Hide the Status Element
   
  };
  speechRecognition.onend = () => {
    // Hide the Status Element
    
  };

  speechRecognition.onresult = (event) => {
    // Create the interim transcript string locally because we don't want it to persist like final transcript
    let interim_transcript = "";

    // Loop through the results from the speech recognition object.
    for (let i = event.resultIndex; i < event.results.length; ++i) {
      // If the result item is Final, add it to Final Transcript, Else add it to Interim transcript
      if (event.results[i].isFinal) {
        final_transcript += event.results[i][0].transcript;
      } else {
        interim_transcript += event.results[i][0].transcript;
      }
    }

    // // Set the Final transcript and Interim transcript.
    // document.querySelector("#final").innerHTML = final_transcript;
    // document.querySelector("#interim").innerHTML = interim_transcript;
    // if (interim_transcript) {
    //     apex.item("P1_PROMPT").setValue(apex.item("P1_PROMPT").getValue()+" "+interim_transcript);
    // }
       if (final_transcript) {
        apex.item("P1_PROMPT").setValue(final_transcript);
    }
  };

//   // Set the onClick property of the start button
//   $("document").on("click", ".fa-microphone",() => {
//     // Start the Speech Recognition
//     speechRecognition.start();
//     console.log("started");
//     apex.item("P1_PROMPT").setValue("");
//     $(".fa-microphone").removeClass("fa-microphone").addClass("fa-stop-circle fa-anim-flash");
//   });

 document.querySelector(".llm-recording").onclick = function(){
    if (recording){
        speechRecognition.stop();
        recording = false;
        $(".fa-stop-circle").removeClass("fa-stop-circle fa-anim-flash").addClass("fa-microphone");
    } else{
        speechRecognition.start();
        recording = true;
        apex.item("P1_PROMPT").setValue("");
        $(".fa-microphone").removeClass("fa-microphone").addClass("fa-stop-circle fa-anim-flash");
    }
 };
  

//   // Set the onClick property of the stop button
//   $("document").on("click", ".fa-stop-circle",() => {
//     // Stop the Speech Recognition
//     speechRecognition.stop();
//     $(".fa-stop-circle").removeClass("fa-stop-circle fa-anim-flash").addClass("fa-microphone");
//     console.log("stopped");
//   });
} else {
  console.log("Speech Recognition Not Available");
}