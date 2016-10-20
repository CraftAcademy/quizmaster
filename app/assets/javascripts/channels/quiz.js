App.cable.subscriptions.create("QuizChannel", {
    collection: function () {
        return $("#message");
    },

    connected: function () {
        // Called when the subscription is ready for use on the server
    },

    disconnected: function () {
        // Called when the subscription has been terminated by the server
    },

    received: function (data) {
        // Called when there's incoming data on the websocket for this channel
        return this.printMessage(data)

    },

    printMessage: function(data) {
      if(data.welcome == "true") {
        return this.collection().html(
          "<p>" + data.message + "</p>"
        );
      } else {
        return this.collection().html(
          data
          // "<p>" + data.index + ". " + data.question + "</p>"

        );
      }
    }
});
