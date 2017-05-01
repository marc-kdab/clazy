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

#include "connect-not-normalized.h"
#include "Utils.h"
#include "HierarchyUtils.h"
#include "QtUtils.h"
#include "TypeUtils.h"
#include "checkmanager.h"

#include <clang/AST/AST.h>

using namespace clang;
using namespace std;

ConnectNotNormalized::ConnectNotNormalized(const std::string &name, ClazyContext *context)
    : CheckBase(name, context)
{
    enablePreProcessorCallbacks();
}

void ConnectNotNormalized::VisitStmt(clang::Stmt *stmt)
{
}

void ConnectNotNormalized::VisitMacroExpands(const Token &macroNameTok, const SourceRange &range)
{
    IdentifierInfo *ii = macroNameTok.getIdentifierInfo();
    if (!ii)
        return;

    StringRef name = ii->getName();
    if (name != "Q_ARG" && name != "Q_RETURN_ARG")
        return;

    auto charRange = Lexer::getAsCharRange(range, sm(), lo());
    string text = Lexer::getSourceText(charRange, sm(), lo());
    text = text.substr(name.size() + 1, text.size() - name.size() - 1);


    checkNormalized(text, range.getBegin());
}

void ConnectNotNormalized::checkNormalized(const std::string &signature, SourceLocation loc)
{
    llvm::errs() << "tex: " << signature << "\n";

    if (QtUtils::connectSignatureIsNormalized(signature))
        return;

    emitWarning(loc, "Signature is not normalized");
}

REGISTER_CHECK("connect-not-normalized", ConnectNotNormalized, CheckLevel0)
