# This file is part of the nesC compiler.
#    Copyright (C) 2002 Intel Corporation
# 
# The attached "nesC" software is provided to you under the terms and
# conditions of the GNU General Public License Version 2 as published by the
# Free Software Foundation.
# 
# nesC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with nesC; see the file COPYING.  If not, write to
# the Free Software Foundation, 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

true;

sub gen() {
    my ($classname, %csts) = @_;

    &usage("no classname name specified") if !defined($java_classname);

    $java_extends = "extends $java_extends" if defined($java_extends);
    if ($java_classname =~ /(.*)\.([^.]*)$/) {
	$package = $1;
	$java_classname = $2;
    }

    print "/**\n";
    print " * This class is automatically generated by ncg. DO NOT EDIT THIS FILE.\n";
    print " * This class includes values of some nesC constants from\n";
    print " * $cfile.\n";
    print " */\n\n";

    print "package $package;\n\n" if $package;

    print "public class $java_classname $java_extends {\n";

    foreach $name (keys %csts) {
	$val = $csts{$name};
	# Find smallest type that will hold val to avoid annoying
	# java "loss of precision" errors
	if ($val >= -128 && $val < 128) {
	    $type = "byte";
	} elsif ($val >= -32768 && $val < 32768) {
	    $type = "short";
	} elsif ($val >= 0 && $val < 65536) {
	    $type = "char";
	} elsif ($val >= -(1 << 31) && $val < (1 << 31)) {
	    $type = "int";
	} else {
	    $type = "long";
	}
	print "    public static final $type $name = $val;\n";
    }

    print "}\n";
}
