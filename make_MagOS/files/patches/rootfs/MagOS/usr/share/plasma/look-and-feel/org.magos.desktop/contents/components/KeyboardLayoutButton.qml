/***************************************************************************
 *   Copyright (C) 2014 by Daniel Vrátil <dvratil@redhat.com>              *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.1

import org.kde.plasma.components 2.0 as PlasmaComponents

import org.kde.plasma.workspace.keyboardlayout 1.0

PlasmaComponents.Button {
    id: kbLayoutButton

    property bool hidden : false

    implicitWidth: minimumWidth
    text: layout.currentLayoutDisplayName

    Accessible.name: i18ndc("plasma_lookandfeel_rosa.fresh.lookandfeel", "Button to change keyboard layout", "Switch layout")

    onClicked: {
        layout.nextLayout();
    }

    visible: !hidden && layout.layouts.length > 1


    KeyboardLayout {
          id: layout

          function nextLayout() {
              var layouts = layout.layouts;
              var index = (layouts.indexOf(layout.currentLayout)+1) % layouts.length;

              layout.currentLayout = layouts[index];
          }
    }
}
