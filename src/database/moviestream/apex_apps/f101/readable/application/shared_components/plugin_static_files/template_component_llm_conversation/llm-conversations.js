function convert(pJSONData, pDIV) {
         
         // Sample JSON data
         
         
         // Get the container element where the table will be inserted
         let container = document.getElementById(pDIV);
         container.style.overflow = "auto";
         
         // Create the table element
         let table = document.createElement("table");

         if (pJSONData.length == 0 ){
             pJSONData[0] = {"SQL_RESPONSE" : "No Rows Returned."}
         }
       
         // Get the keys (column names) of the first object in the JSON data
         let cols = Object.keys(pJSONData[0]);
        
        // Support only 5 columns in the UI
        //  cols.splice(5);
         
         // Create the header element
         let thead = document.createElement("thead");
         let tr = document.createElement("tr");
         
         // Loop through the column names and create header cells
         cols.forEach((item) => {
            let th = document.createElement("th");
            th.innerText = item; // Set the column name as the text of the header cell
            tr.appendChild(th); // Append the header cell to the header row
         });
         thead.appendChild(tr); // Append the header row to the header
         table.append(tr) // Append the header to the table
         
         // Loop through the JSON data and create table rows
         pJSONData.forEach((item) => {
            let tr = document.createElement("tr");
            
            // Get the values of the current object in the JSON data
            let vals = Object.values(item);
            
            // Loop through the values and create table cells
            vals.forEach((elem) => {
               let td = document.createElement("td");
               console.log(typeof elem);
               var number = false;
               if (typeof elem == "number"){
                   //elem = apex.locale.formatNumber( elem, "999G999G999G999G990D00" );
                    number = true;
               }
               td.innerText = elem; // Set the value as the text of the table cell
               if (number){td.style.textAlign = "right"}
               tr.appendChild(td); // Append the table cell to the table row
            });
            table.appendChild(tr); // Append the table row to the table
         });
         container.appendChild(table) // Append the table to the container element

      }
var cnt = 0;
function scrollToLast(){
    if ($(".prompt-box").length > 0 && cnt == $(".prompt-box").length){
         $([document.documentElement, document.body]).animate({
        scrollTop: $('.prompt-box').last().offset().top-120
    }, 2000);
    }
   
}


$( function () {

    
  $(".response").each(function(e){
     var type = $(this).data("type");
     var id = $(this).data("id");

    if (type == "response"){


    apex.server.process("GET_RESPONSE",{x01: id},{dataType: "json", success: function(pData){
         console.log(pData.response);
   document.getElementById('response-'+pData.id).innerHTML = pData.response;
   $(".llm-load-message-"+pData.id).hide();
   cnt++;
   scrollToLast();

    }});

    } else{
         $(".llm-more-rows-"+id).hide();
             apex.server.process("GET_SQL_RESULTS",{x01: id},{dataType: "json", success:
         function(pData){
        
        convert(pData.results, 'response-'+ pData.id);
        cnt++;
        scrollToLast();
 
        console.log(pData);
        if (pData.totalRowCount > 10){
             $(".llm-more-rows-"+pData.id).show();
        }
        $(".llm-load-message-"+pData.id).hide();
    }});
    }


     
  })

  

  var cardActions = {
            name: "llm-actions",
            action: function(event, element, args) {
                apex.items.P1_CURRENT_ID.value = args.id;
                apex.event.trigger(document, args.event);
            }
        }

    apex.actions.add([cardActions]);

});
