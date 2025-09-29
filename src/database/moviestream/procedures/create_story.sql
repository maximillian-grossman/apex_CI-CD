create or replace procedure create_story (
    cust_id      in number,
    characters   in clob,  -- array of characters ["sari","pula"]
    movies       in clob,      -- array of movies ["Big","Finding Nemo"]
    title        out varchar2,  -- generated title
    story        out clob,      -- generated story    
    profile_name in varchar2 default 'GENAI'
)
    authid current_user
is

    prompt     clob;
    json_doc   blob;
    b_doc      soda_document_t;
    created    date := sysdate;
    success    number;
    collection soda_collection_t;
begin

    -- Generate the prompt for creating the story using the characters and movies
    prompt := sysdate
              || ' - Generate a new 2 page story targeted for a child. Make this story unique. Put the complete story title on the first line and do not use emojis in the title. Then start the story on the next line. Use lots of emojis. The story should be similar in concept and tone to the following list of movies:\n'
              || movies
              || '\nUse the following character names in the generated story:\n'
              || characters;

    -- debug
    workshop.write(prompt);
    workshop.write('generating story');

    -- Generate the story using the content
    story := dbms_cloud_ai.generate(
        prompt       => prompt,
        profile_name => profile_name,
        action       => 'chat'
    );

    -- The title is the first line of the story
    -- Remove double-quotes
    title := replace(
        substr(story,
               1,
               instr(story,
                     chr(10)) - 1),
        '"',
        ''
    );

    -- debug
    workshop.write(title);
    workshop.write(story);

    -- Create the document with the results
    select
        json_object(
            'cust_id' value cust_id,
                    'id' value dbms_random.string('X', 20),
                    'created' value to_char(created, 'YYYY-MM-DD HH:MI'),
                    'title' value title,
                    'story' value story
        returning blob)
    into json_doc
    from
        dual;

    -- Add the story to the collection
    collection := dbms_soda.open_collection('stories');
    workshop.write('try adding to collection' || collection.get_metadata);

    -- Create the JSON document
    b_doc := soda_document_t(b_content => json_doc);
    workshop.write('document object created. now insert it.');

    -- Insert it
    success := collection.insert_one(b_doc);

    -- debug
    workshop.write('Success: ' || success);
exception
    when others then
        title := 'Sorry. Try again later!';
        story := 'Sorry, we couldn''t create your story. Please share this error message with an adult: \n' || sqlerrm;
end create_story;
/


-- sqlcl_snapshot {"hash":"6be9a4202ff8df74dd35b4cd0eb64b9ea4882b93","type":"PROCEDURE","name":"CREATE_STORY","schemaName":"MOVIESTREAM","sxml":""}