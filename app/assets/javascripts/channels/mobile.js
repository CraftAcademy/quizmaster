App.quiz_mobile = App.mobile.subscriptions.create("QuizMobileChannel", {
    collection: function () {
        return $("#message");
    },

    connected: function () {
      console.log('mobile connected');
        // Called when the subscription is ready for use on the server
    },

    disconnected: function () {
        // Called when the subscription has been terminated by the server
    },

    received: function (data) {
        // Called when there's incoming data on the websocket for this channel
        return this.printMessage(data)
        // return "Hallo there!";
    },

    printMessage: function (data) {
        if (data.welcome == "true") {
            return this.collection().html(
                "<p>" + data.message + "</p>"
            );
        } else {
            return this.collection().html(data);
        }
    },
    submitAnswer: function (message) {
        return this.perform('submit_answer', {
            message: message
        });
    }
});
