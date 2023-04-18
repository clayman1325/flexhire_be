module FlexHire
    def update_front_end(params)
        websocket = SocketConnection.new()
        websocket.send('new_data', params)
    end
end