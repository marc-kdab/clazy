/*
  This file is part of the clazy static checker.

  Copyright (C) 2017 Sergio Martins <smartins@kde.org>

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Library General Public
  License as published by the Free Software Foundation; either
  version 2 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Library General Public License for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; see the file COPYING.LIB.  If not, write to
  the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
  Boston, MA 02110-1301, USA.
*/

#ifndef CLAZY_CONNECT_NOT_NORMALIZED_H
#define CLAZY_CONNECT_NOT_NORMALIZED_H

#include "checkbase.h"


/**
 * See README-connect-not-normalized.md for more info.
 */
class ConnectNotNormalized : public CheckBase
{
public:
    explicit ConnectNotNormalized(const std::string &name, ClazyContext *context);
    void VisitStmt(clang::Stmt *stmt) override;
protected:
    void VisitMacroExpands(const clang::Token &macroNameTok, const clang::SourceRange &) override;
private:
    void checkNormalized(const std::string &signature, clang::SourceLocation loc);
};

#endif
