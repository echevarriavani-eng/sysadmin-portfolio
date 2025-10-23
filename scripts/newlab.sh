#!/bin/bash
# Automated Lab Creation Script for Empress Arys

# Prompt for lab name
read -p "Enter Lab Name: " LABNAME

# Define directory
LABDIR=~/SysAdmin/Portfolio/$LABNAME

# Create new lab folder
mkdir -p "$LABDIR"
cd "$LABDIR"

# Create Markdown report with header
cat <<EOF > README.md
# $LABNAME
**Created by:** Stevanie Echevarria
**Date:** $(date '+%B %d, %Y – %H:%M:%S')
**System:** $(hostnamectl | grep "Operating System" | cut -d: -f2)

---

## Objective
Describe the purpose of this lab.

## Commands Used
\`\`\`bash

\`\`\`

## Output & Results
(Insert screenshots or output here)

## Reflection
Write what you learned from this lab.

EOF

# Stage new lab to Git
git add "$LABDIR"

# Open Nano automatically
nano README.md
