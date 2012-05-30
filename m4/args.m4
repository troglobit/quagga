#
# QUAGGA_ARG_WITH and QUAGGA_ARG_ENABLE are derived from the lldpd
# package by Vincent Bernat <bernat@luffy.cx>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

dnl QUAGGA_ARG_WITH(name, help1, default)
AC_DEFUN([QUAGGA_ARG_WITH],[
AC_ARG_WITH([$1],
AS_HELP_STRING([--with-$1],
        [$2 @<:@default=$3@:>@]),
AC_DEFINE_UNQUOTED(AS_TR_CPP([$1]), ["$withval"], [$2]),
AC_DEFINE_UNQUOTED(AS_TR_CPP([$1]), ["$3"], [$2]))
])

dnl QUAGGA_ARG_ENABLE(name, help1, default)
AC_DEFUN([QUAGGA_ARG_ENABLE],[
AC_ARG_ENABLE([$1],
AS_HELP_STRING([--enable-$1],
        [Enable $2 @<:@default=$3@:>@]),
	[enable_$1=$enableval], [enable_$1=$3])
AC_MSG_CHECKING(whether to enable $1)
  if test x"$enable_$1" = x"yes"; then
     AC_MSG_RESULT(yes)
     AC_DEFINE([ENABLE_]AS_TR_SH([$1]),, [$2])
  else
     AC_MSG_RESULT(no)
  fi
])

dnl QUAGGA_ARG_DISABLE(name, help1), default is assumed to be "enabled"
AC_DEFUN([QUAGGA_ARG_DISABLE],[
  AC_ARG_ENABLE([$1],
	AS_HELP_STRING([--disable-$1],
		[Disable $2 @<:@default=enabled@:>@]),
	[enable_$1=$enableval], [enable_$1=yes])
  AC_MSG_CHECKING(whether to disable $1)
  if test x"$enable_$1" = x"yes"; then
     AC_MSG_RESULT(yes)
     AC_DEFINE([ENABLE_]AS_TR_CPP([$1]),, [$2])
  else
     AC_MSG_RESULT(no)
  fi
])
