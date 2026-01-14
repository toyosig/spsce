# circ

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


<!-- Get Order api -->
if(status=="FULFILLED") => seller side => dispatch button show
if(status=="DISPATCHED") => seller side => DELIVERED OR CANCELLED button show => "dispatch/items"
if(status=="DELIVERED") => seller side => NO button show => show delievered => "confirm-delivery/items"
if(status=="CANCELLED") => seller side => NO button show => show cancelled

buttons => dispatch, delivered, calcelled, 
no button => delivered, cancelled

buyer => cancel it => only buyer can cancel it
seller => dispatch => buyer  => delivered, cancelled => 
