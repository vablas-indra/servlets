// From: AJAX: Web 2.0 para profesionales, M.Firtman (Ed. Marcombo)

function getXHR() {
  req = false;
  if (window.XMLHttpRequest) {
     req = new XMLHttpRequest();
  } else {
     if (ActiveXObject) {
       msVersions = [ "MSXML2.XMLHttp5.0", "MSXML2.XMLHttp4.0",
                      "MSXML2.XMLHttp3.0", "MSXML2.XMLHttp",
		      "Microsoft.XMLHttp" ];
       for (var i=0; i<msVersions.length; i++) {
         try {
           req = new ActiveXObject(msVersions[i]);
           return req;
         } catch (e) {}
       }
     }
   }
   return req;
} 