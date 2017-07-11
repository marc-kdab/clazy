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

#include "StringUtils.h"
#include "qt-modernize-qforeach-with-rvalues.h"
#include "checkmanager.h"

#include <cassert>

using namespace clang;

struct Result {
    bool handle;

    constexpr explicit operator bool() const noexcept { return handle; };
};

static Result handleQForeach(const ForStmt *For, const CXXBindTemporaryExpr *Exp)
{
    if (!For || !Exp)
        return {false};

    // TODO: FixItHint: Q_FOREACH(a, b) -> const auto as = b;\nfor (a : as)

    return {true};
}

void QtModernizeQForeachWithRValues::Callback::run(const clang::ast_matchers::MatchFinder::MatchResult &result)
{
    const auto For = result.Nodes.getNodeAs<ForStmt>("qforeach");
    assert(For);
    const auto Exp = result.Nodes.getNodeAs<CXXBindTemporaryExpr>("expr");
    assert(Exp);
    if (auto r = handleQForeach(For, Exp))
        m_check->emitWarning(For, "Q_FOREACH with rvalue container can be trivially ported to C++11 range-for");
}


QtModernizeQForeachWithRValues::QtModernizeQForeachWithRValues(const std::string &name, ClazyContext *context)
    : CheckBase(name, context), m_callBack(this)
{
}

QtModernizeQForeachWithRValues::~QtModernizeQForeachWithRValues() = default;

const auto qforeachOverRValues = []() {
    using namespace clang::ast_matchers;
    return forStmt(hasLoopInit(hasDescendant(
                callExpr(hasDeclaration(functionDecl(hasName("QtPrivate::qMakeForeachContainer"))),
                         hasArgument(0, cxxBindTemporaryExpr().bind("expr")))
           )));
};

void QtModernizeQForeachWithRValues::registerASTMatchers(clang::ast_matchers::MatchFinder &finder)
{
    finder.addMatcher(qforeachOverRValues().bind("qforeach"), &m_callBack);
}

REGISTER_CHECK("qt-modernize-qforeach-with-rvalues", QtModernizeQForeachWithRValues, CheckLevel0)
