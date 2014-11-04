LBOutlineViewDemo
=================

This projects demonstrates a problem I'm having reloading items in the NSOutlineView.

To test the app - run it and alternate tapping on the different rows. Everytime a row is tapped, the displayed value should increment.

Visit *LBOutlineViewModel* and note the @reloadSelectedIssue@ method. In that method are two ways of reloading items.
The working method uses @reloadDataForRowIndexes:columnIndexes:@ - but I can't seem to get @[_outlineView reloadItem:_selectedItem reloadChildren:YES];
to work. Comment @reloadData@ out to test the @reloadItem@ approach.

