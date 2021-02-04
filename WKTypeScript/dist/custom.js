var jsonTextEditor = ace.edit('source');
var outputTextEditor = ace.edit('output');

var outputStorage = "";
var counter = 0;

function insertJSON(msg) {

  /*outputStorage = outputTextEditor.getSession().getValue().toString();*/

  var inputCode = msg.toString();
  var formatJSON = JSON.stringify(msg);

  window.webkit.messageHandlers.eventListeners.postMessage(`${formatJSON}`);

  jsonTextEditor.getSession().setValue(formatJSON);
  /*
  window.webkit.messageHandlers.eventListeners.postMessage("[ACE] Inserted JSON");

  printOutputCode();
    */
}

function printOutputCode() {
  var outputString = outputTextEditor.getSession().getValue().toString();

  if (outputString != outputString) {
    //outputStorage = outputString
    window.webkit.messageHandlers.eventListeners.postMessage("[ACE] Got output code...");
    window.webkit.messageHandlers.eventListeners.postMessage(outputString);
  } else if (counter <= 20) {
    counter++;
    setTimeout(printOutputCode, 300);
  } else {
    window.webkit.messageHandlers.eventListeners.postMessage("[ACE] Could not retrieve output code.");
  }
}