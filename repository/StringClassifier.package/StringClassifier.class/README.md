I am used to classify strings into a small set of groups, based on a set of blocks.  My #bestMatchIndexesFor:  returns an array like #(3 1 2) to mean the first string is in group 3, the second in group 1, and the third in group 2.

    Instance Variables
	changeValuesToMatches:		<Collection of single argument blocks, value is a percent>

    The #addChangeValuesToMatch: blocks should grade the string for how close to a match it is, should return a positive number (0.0 to 1.0, but any positive number would work)