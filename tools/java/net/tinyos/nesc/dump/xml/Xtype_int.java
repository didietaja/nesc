// $Id$
/*									tab:4
 * Copyright (c) 2004-2005 Intel Corporation
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached INTEL-LICENSE     
 * file. If you do not find these files, copies can be found by writing to
 * Intel Research Berkeley, 2150 Shattuck Avenue, Suite 1300, Berkeley, CA, 
 * 94704.  Attention:  Intel License Inquiry.
 */

package net.tinyos.nesc.dump.xml;

import org.xml.sax.*;

/**
 * An integer type.
 */
public class Xtype_int extends SimpleType
{
    /**
     * True if the integer type is unsigned.
     */
    public boolean unsignedType;

    public NDElement start(Attributes attrs) {
	super.start(attrs);
	unsignedType = boolDecode("unsigned");
	return this;
    }
}