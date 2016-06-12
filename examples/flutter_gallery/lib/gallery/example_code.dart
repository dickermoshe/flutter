// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Note: This code is not runnable, it contains code snippets displayed in the
// gallery.

import 'package:flutter/material.dart';

class ButtonsDemo {
  void setState(VoidCallback callback) { }
  BuildContext context;

  void buttons() {

// START buttons_raised
// Create a raised button.
new RaisedButton(
  child: new Text('BUTTON TITLE'),
  onPressed: () {
    // Perform some action
  }
);

// Create a disabled button.
// Buttons are disabled when onPressed isn't
// specified or is null.
new RaisedButton(
  child: new Text('BUTTON TITLE'),
  onPressed: null
);
// END


// START buttons_flat
// Create a flat button.
new FlatButton(
  child: new Text('BUTTON TITLE'),
  onPressed: () {
    // Perform some action
  }
);

// Create a disabled button.
// Buttons are disabled when onPressed isn't
// specified or is null.
new FlatButton(
  child: new Text('BUTTON TITLE'),
  onPressed: null
);
// END


// START buttons_dropdown
// Member variable holding value.
String dropdownValue;

// Drop down button with string values.
new DropDownButton<String>(
  value: dropdownValue,
  onChanged: (String newValue) {
    // null indicates the user didn't select a
    // new value.
    setState(() {
      if (newValue != null)
        dropdownValue = newValue;
    });
  },
  items: <String>['One', 'Two', 'Free', 'Four']
    .map((String value) {
      return new DropDownMenuItem<String>(
        value: value,
        child: new Text(value));
    })
    .toList()
);
// END


// START buttons_icon
// Member variable holding toggle value.
bool value;

// Toggleable icon button.
new IconButton(
  icon: Icons.thumb_up,
  onPressed: () {
    setState(() => value = !value);
  },
  color: value ? Theme.of(context).primaryColor : null
);
// END


// START buttons_action
// Floating action button in Scaffold.
new Scaffold(
  appBar: new AppBar(
    title: new Text('Demo')
  ),
  floatingActionButton: new FloatingActionButton(
    child: new Icon(icon: Icons.add),
    onPressed: null
  )
);
// END
  }
}


class SelectionControls {
  void setState(VoidCallback callback) { }

  void selectionControls() {

// START selectioncontrols_checkbox
// Member variable holding the checkbox's value.
bool checkboxValue = false;

// Create a checkbox.
new Checkbox(
  value: checkboxValue,
  onChanged: (bool value) {
    setState(() {
      checkboxValue = value;
    }
  );
});

// Create a disabled checkbox.
// Checkboxes are disabled when onChanged isn't
// specified or null.
new Checkbox(value: false, onChanged: null);
// END


// START selectioncontrols_radio
// Member variable holding value.
int radioValue = 0;

// Method setting value.
void handleRadioValueChanged(int value) {
  setState(() {
    radioValue = value;
  });
}

// Creates a set of radio buttons.
new Row(
  children: <Widget>[
    new Radio<int>(
      value: 0,
      groupValue: radioValue,
      onChanged: handleRadioValueChanged
    ),
    new Radio<int>(
      value: 1,
      groupValue: radioValue,
      onChanged: handleRadioValueChanged
    ),
    new Radio<int>(
      value: 2,
      groupValue: radioValue,
      onChanged: handleRadioValueChanged
    )
  ]
);

// Creates a disabled radio button.
new Radio<int>(
  value: 0,
  groupValue: 0,
  onChanged: null
);
// END


// START selectioncontrols_switch
// Member variable holding value.
bool switchValue = false;

// Create a switch.
new Switch(
  value: switchValue,
  onChanged: (bool value) {
    setState(() {
      switchValue = value;
    }
  );
});

// Create a disabled switch.
// Switches are disabled when onChanged isn't
// specified or null.
new Switch(value: false, onChanged: null);
// END
  }
}


class GridLists {
  void gridlists() {
// START gridlists
// Creates a scrollable grid list with images
// loaded from the web.
new ScrollableGrid(
  delegate: new FixedColumnCountGridDelegate(
    columnCount: 3,
    tileAspectRatio: 1.0,
    padding: const EdgeInsets.all(4.0),
    columnSpacing: 4.0,
    rowSpacing: 4.0
  ),
  children: <String>[
    'https://example.com/image-0.jpg',
    'https://example.com/image-1.jpg',
    'https://example.com/image-2.jpg',
    '...',
    'https://example.com/image-n.jpg'
  ].map((String url) {
    return new GridTile(
      footer: new GridTileBar(
        title: new Text(url)
      ),
      child: new NetworkImage(
        src: url,
        fit: ImageFit.cover
      )
    );
  })
);
// END
  }
}
