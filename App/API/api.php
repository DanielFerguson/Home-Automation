<?php
include 'config/server.php';

if (isset($_GET["auth_key"]) && $_GET["auth_key"] == AUTH_KEY) {
    // Postman API Debug -- remove before production
    $fname = $_GET["f_name"];
    $fname = ucfirst($fname);
    echo "\nHello, $fname!";


    // Convert $_POST values to integers
    $ownerID = (is_numeric($_GET["owner_id"]) ? (int)$_GET["owner_id"] : 0);
    $sensorID = (is_numeric($_GET["sensor_id"]) ? (int)$_GET["sensor_id"] : 0);
    $moisture = (is_numeric($_GET["moisture_value"]) ? (float)$_GET["moisture_value"] : 0);
    
    $id = 5;

    // Connecting, selecting database
    $dbconn = pg_connect("host=".HOST." dbname=".DB." user=".USER." password=".PASS)
    or die('Could not connect: ' . pg_last_error());

    // Get Last ID, increment 1
    // $query = "SELECT MAX(id) FROM data";
    // $id = pg_query($query) or die('Query failed: ' . pg_last_error());

    // Performing SQL query
    $data_entry_sql = "INSERT INTO data (owner_id, sensor_id, id, moisture_value) VALUES ($1, $2, $3, $4)";
    pg_prepare('data_entry', $data_entry_sql);
    pg_execute('data_entry', array($ownerID, $sensorID, $id, $moisture)) or die("Error while inserting");


    // Closing connection
    pg_close($dbconn);
}

// TODO Fix timestamp sending -> maybe send from another API or from local server?
// TODO ID updating - potentially auto-increment on the server?

?>