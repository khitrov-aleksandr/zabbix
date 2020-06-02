function sendSms(login, password, host, phone, message, source) {
    req = new CurlHttpRequest();
    return req.Get(
        'https://' + host +
        '/multi.php?login=' + login +
        '&password=' + password +
        '&phones=' + phone +
        '&rus=5&originator=' + source +
        '&message=' + message
    );
}

try {
    var params = JSON.parse(value);
    result = sendSms(
        params.login,
        params.password,
        params.host,
        params.phone,
        params.message,
        params.source
    );
    
    error = JSON.stringify(result.error);
    return JSON.stringify(result);

} catch (error) {
    Zabbix.Log(5, 'Smstraffic message send failed: ' + error);
    throw 'Smstraffic message send failed: ' + error;
}
