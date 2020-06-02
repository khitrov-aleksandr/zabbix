try {
    var params = JSON.parse(value),
        req = new CurlHttpRequest(),
        fields = {},
        result;

    req.AddHeader('Content-Type: application/json');
    req.AddHeader('Access-Token: ' + params.token);

    url = params.url.replace(/\/+$/, '');

    result = req.Post(url, JSON.stringify({
      "title": params.title,
      "body": params.message,
      "email": params.email,
      "type": "note",
    }));
    
    error = JSON.stringify(result.error);
    return JSON.stringify(result);

} catch (error) {
    Zabbix.Log(5, 'Pushbullet message send failed: ' + error);
    throw 'Pushbullet message send failed: ' + error;
}
