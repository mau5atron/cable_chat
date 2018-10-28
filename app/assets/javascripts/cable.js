// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});


	// 'Consumer' is a client of a web socket connection that can subscribe 
	// to one or multiple channels. Each ActionCable server may handle multiple connections
	// 'Channel' is similar to an MVC controller and is used for streaming.
  App.cable = ActionCable.createConsumer();

}).call(this);
