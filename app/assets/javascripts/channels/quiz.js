App.cable.subscriptions.create("QuizChannel", {
    collection: function () {
        return $("#message");
    },

    connected: function () {
        // Called when the subscription is ready for use on the server
        //return this.collection().append('We are connected');
    },

    disconnected: function () {
        // Called when the subscription has been terminated by the server
    },

    received: function (data) {
        // Called when there's incoming data on the websocket for this channel
        return this.printMessage(data)

    },

    printMessage: function(data) {
        var message = data.message;
        console.log(message);
        return this.collection().append("<p>" + message + "</p>");
    }
});
