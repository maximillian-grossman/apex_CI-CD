// $( function () {

    
//   $(".response").each(function(e){
//      var url = $(this).data("url");
//      var id = $(this).data("id");
//      const options = {
//         method: 'GET',
//         headers: new Headers({'content-type': 'application/json'})
//     };
//     fetch(url)
//   .then(response => response.json())
//   .then(data => {
//     console.log(data.response);
//    document.getElementById('response-'+data.id).innerHTML = data.response;
//   })
     
//   })

//   var cardActions = {
//             name: "llm-actions",
//             action: function(event, element, args) {
//                 apex.items.P1_CURRENT_ID.value = args.id;
//                 apex.event.trigger(document, args.event);
//             }
//         }

//     apex.actions.add([cardActions]);

// });
