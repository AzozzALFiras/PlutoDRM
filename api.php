<?php

// The DRM has been Created By Azozz Azozz ALFiras

// for disbale file when sent request GET
$REQUEST_METHOD = $_SERVER['REQUEST_METHOD'];
if(strcasecmp($REQUEST_METHOD, "GET") == 0){
header($_SERVER["SERVER_PROTOCOL"]."Error method", true, 405);
exit();
} else{

// the url for sent request to Plutorepo DRM
$url3Request = "https://secured.plutorepo.com/activation/services/activate";

// u can get the api from url
// https://developer.plutorepo.com/dev/panel/API
$apiKey = "123457893zozz";

// bundleIdentifier for your package like : co.azozzalfiras.lockapps
$BundleID = "co.azozzalfiras.lockapps";


// hidden error json
error_reporting(0);


// get request data
$data =  file_get_contents('php://input');
$jsondata = json_decode($data, true);

// get udid & deviceModel

$udid =  $jsondata['udid'];
$model = $jsondata['deviceModel'];

if($udid && $model){

function SentRequest3zozz(string $url, string $udid__, string $model__ , string $bundleIdentifier , string $apiKey__) {
$Response3zozz = stream_context_create([
"http" => [
"method"        => "POST",
'header'  => "Content-type: application/x-www-form-urlencoded",
'header'  => "3zozz ALFiras",
"content"       => http_build_query([
'udid' => $udid__,
'deviceModel' => $model__,
'packageIdentifier' => $bundleIdentifier,
'apiKey' => $apiKey__
]),
"ignore_errors" => true,
],
]);

$response = file_get_contents($url, false, $Response3zozz);


$status_line = $http_response_header[0];

preg_match('{HTTP\/\S*\s(\d{3})}', $status_line, $match);

$status = $match[1];

if ($status !== "200") {
throw new RuntimeException("unexpected response status: {$status_line}\n" . $response);
}



// get info json
$status = json_decode($response)->status;
$statusCode = json_decode($response)->statusCode;
$canActivate = json_decode($response)->canActivate;
$message = json_decode($response)->message;


// edit something on response because create problem with Objective -c
// for fixed i create some edit to response

if($canActivate == 1){
$Status__ = "completed";
}else{
$Status__ = $canActivate;
}

if($statusCode == 200){
$StatusText = "Yeah";
} else {
$StatusText = $statusCode;

}

// don't change anything here

$myObj->status = $status;
$myObj->StatusText = $StatusText;
$myObj->Status3zozz = $Status__;
$myObj->AlertText = $message;
$myJSON = json_encode($myObj);

return $myJSON;


}


echo SentRequest3zozz($url3Request,$udid,$model,$BundleID,$apiKey);

} else {

$myObj->status = "azfLibrary";
$myObj->StatusText = "Please install azfLibrary ";
$myObj->Status3zozz = false;
$myObj->AlertText = "You don't install azfLibrary on your device";
$myJSON = json_encode($myObj);

}
}

?>
