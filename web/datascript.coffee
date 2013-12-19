data = graphdata

graph_width = () -> return document.getElementById("graphspace").clientWidth
x_space_between_points = () -> return graph_width() / ((values data).length - 1)
get_x_position = (count) -> return Math.round count * x_space_between_points()
y_space_between_points = () -> return graph_height() / maxim values data
get_y_position = (value) -> return Math.round graph_height() - value * y_space_between_points()
graph_height = () -> 100
get_point_string = (value, count) -> return get_x_position(count)+","+get_y_position(value)

maxim = (data, i=0) ->
    if i+1 == data.length
        return Math.max(-Infinity,data[i])
    else
        return Math.max(data[i],maxim data, i+1)

values = (dictionary) ->
    (v for k,v of  dictionary)

keys = (dictionary) ->
    (k for k,v of dictionary)

get_points = (data, area=true) ->
    points = (get_point_string data[i], i for i in [0..data.length-1])
    if area
        points.unshift 0+","+graph_height()
        points.push graph_width()+","+graph_height()
    return points.join " "

initialize_graph = () ->
    vals = values graphdata
    alert vals
    svg = document.getElementById 'tc_graph'
    svg.setAttribute 'width', graph_width()
    sns = svg.namespaceURI
    polygon = document.createElementNS(sns, 'polygon')
    polygon.setAttribute "points", get_points(vals)
    polygon.setAttribute "fill", "url(#grad1)"
    svg.appendChild(polygon)

load_day_report = (day) ->
    if (typeof @XMLHttpRequest == "undefined")
        console.log 'XMLHttpRequestis undefined'
        @XMLHttpRequest = ->
            try
                return new ActiveXObject("Msxml2.XMLHTTP.6.0")
            catch error
            try
                return new ActiveXObject("Msxml2.XMLHTTP.3.0")
            catch error
            try
                return new ActiveXObject("Microsoft.XMLHTTP")
            catch error
            throw new Error("This browser does not support XMLHttpRequest.")
    req = new XMLHttpRequest()
    req.addEventListener 'readystatechange', ->
        if req.readyState is 4
            success_resultcodes = [200, 304]
            if req.status in success_resultcodes
                document.getElementById('reportcontent').innerHTML = req.responseText

initialize_graph()
