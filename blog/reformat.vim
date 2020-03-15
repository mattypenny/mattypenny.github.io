" Convert html bullet list to markdown
%s/<ul>//g
%s/<\/ul>//g
%s/  *<li>/* /g
%s/<\/li>//g

" Convert &quot; and &#039; to quote 
%s/&quot;/"/g
%s/&#039;/"/g
$
" Convert chevrons
%s/&lt;/</g
%s/&gt;/>/g

" Un-draft!
%s/draft: Yes/draft: No

" Change <code> to backticks
%s/<pre><code>/```/g
%s/<\/pre><\/code>/```/g
%s/<\/code><\/pre>/```/g
%s/<code>/```/g
%s/<\/code>/```/g
%s/\[code\]/```/g
%s/\[code..*\]/```/g
%s/\[\/code\]/```/g

" Un-muck-up dashes
%s/–/-/g

# Replace <br> with new lines
%s/<br \/>/\r/g
%s/<br>/\r/g


# Get rid of <p>
%s/<p>//g
%s/<\/p>//g
