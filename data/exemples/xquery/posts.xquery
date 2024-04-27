declare option output:method "xml";
declare option output:indent "yes";
declare option output:encoding "UTF-8";

<posts>{
  for $post in /posts/row
  order by number($post/@Score) descending
  let $id := data($post/@Id) (: Use data() function to get the string value :)
  let $title := data($post/@Title)
  let $score := data($post/@Score)
  let $viewCount := data($post/@ViewCount)
  let $commentCount := data($post/@CommentCount)
  let $creationDate := data($post/@CreationDate)
  let $answerCount := data($post/@AnswerCount)
  let $tags := data($post/@Tags)
  let $ownerUserId := data($post/@OwnerUserId)
  where $post/@PostTypeId = "1" (: Esto asume que solo quieres preguntas :)
  return
    <post>
      <id>{$id}</id>
      <title>{$title}</title>
      <score>{$score}</score>
      <viewCount>{$viewCount}</viewCount>
      <commentCount>{$commentCount}</commentCount>
      <creationDate>{$creationDate}</creationDate>
      <answerCount>{$answerCount}</answerCount>
      <tags>{$tags}</tags>
      <ownerUserId>{$ownerUserId}</ownerUserId>
    </post>
}</posts>
