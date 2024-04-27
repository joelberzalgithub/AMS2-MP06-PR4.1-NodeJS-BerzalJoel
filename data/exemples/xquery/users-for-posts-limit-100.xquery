declare option output:method "xml";
declare option output:indent "yes";
declare option output:encoding "UTF-8";

let $ownerUserIds := subsequence(
  (
    for $post in /posts/row
    where $post/@PostTypeId = "1"
    order by number($post/@Score) descending
    return string($post/@OwnerUserId) (: Ensure the result is a string :)
  ),
  1, 100
)
return
<users>{
  for $userId in distinct-values($ownerUserIds)
  let $user := /users/row[@Id = $userId]
  where exists($user) (: Ensure user exists :)
  let $id := data($user/@Id)
  let $displayName := data($user/@DisplayName)
  let $reputation := data($user/@Reputation)
  let $creationDate := data($user/@CreationDate)
  let $location := data($user/@Location)
  let $aboutMe := data($user/@AboutMe)
  order by number($user/@Reputation) descending
  return
    <user>
      <id>{$id}</id>
      <displayName>{$displayName}</displayName>
      <reputation>{$reputation}</reputation>
      <creationDate>{$creationDate}</creationDate>
      <location>{$location}</location>
      <aboutMe>{$aboutMe}</aboutMe>
    </user>
}</users>
