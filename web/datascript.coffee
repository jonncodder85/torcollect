data = [152, 121, 37, 7, 169, 135, 78, 74, 5, 72, 173, 132, 196, 14, 183, 72, 180, 183, 51, 56, 91, 125, 171, 20, 56, 138, 131, 144, 87, 11, 69, 38, 119, 1, 42, 86, 172, 148, 35, 169, 120, 147, 164, 90, 40, 92, 160, 17, 180, 145, 166, 29, 64, 121, 189, 22, 199, 144, 19, 144, 59, 85, 121, 42, 198, 42, 140, 48, 75, 140, 41, 45, 191, 189, 46, 96, 165, 9, 172, 191, 51, 158, 115, 196, 191, 59, 6, 79, 175, 127, 99, 157, 35, 91, 143, 6, 172, 38, 138, 175, 54, 111, 45, 15, 31, 127, 138, 185, 76, 140, 164, 16, 138, 45, 25, 156, 21, 121, 158, 0, 67, 160, 123, 112, 77, 75, 130, 37, 95, 93, 126, 125, 152, 2, 94, 191, 153, 120, 107, 123, 52, 200, 25, 27, 122, 18, 42, 133, 9, 127, 112, 190, 49, 30, 165, 13, 168, 118, 178, 113, 95, 152, 53, 11, 39, 12, 42, 191, 93, 107, 14, 175, 153, 11, 8, 24, 121, 134, 47, 129, 187, 100, 177, 102, 189, 120, 192, 93, 75, 127, 152, 59, 117, 147, 27, 96, 184, 199, 95, 16, 113, 167, 2, 102, 14, 55, 74, 110, 35, 49, 101, 43, 138, 72, 122, 180, 176, 78, 49, 5, 76, 153, 87, 41, 7, 21, 96, 23, 28, 194, 136, 11, 186, 134, 67, 121, 90, 87, 11, 168, 180, 79, 6, 185, 106, 167, 173, 188, 115, 49, 104, 60, 190, 58, 5, 145, 139, 78, 171, 157, 169, 185, 51, 143, 79, 20, 24, 166, 181, 100, 35, 75, 105, 161, 77, 145, 129, 32, 81, 2, 195, 134, 104, 196, 100, 27, 157, 54, 141, 99, 108, 72, 104, 91, 184, 142, 158, 184, 108, 80]

graph_width = () -> return document.getElementById("graphspace").clientWidth
x_space_between_points = () -> return graph_width() / data.length
get_x_position = (count) -> return Math.round count * x_space_between_points()
y_space_between_points = () -> return graph_height() / maxim data
get_y_position = (value) -> return Math.round graph_height() - value * y_space_between_points()
graph_height = () -> 100
get_point_string = (value, count) -> return get_x_position(count)+","+get_y_position(value)

maxim = (data, i=0) ->
    if i+1 == data.length
        return Math.max(-Infinity,data[i])
    else
        return Math.max(data[i],maxim data, i+1)

get_points = (data, area=true) ->
    points = (get_point_string data[i], i for i in [0..data.length-1])
    if area
        points.unshift 0+","+graph_height()
        points.push graph_width()+","+graph_height()
    return points.join " "

initialize_graph = () ->
    svg = document.getElementById 'tc_graph'
    svg.setAttribute 'width', graph_width()
    sns = svg.namespaceURI
    polygon = document.createElementNS(sns, 'polygon')
    polygon.setAttribute "points", get_points(data)
    polygon.setAttribute "fill", "url(#grad1)"
    svg.appendChild(polygon)
initialize_graph()
