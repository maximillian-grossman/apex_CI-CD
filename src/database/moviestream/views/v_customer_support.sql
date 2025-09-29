create or replace force editionable view v_customer_support (
    support_chat_id,
    support_chat
) as
    (
        select
            1                                                                                                                                         as
            support_chat_id,
            q'[ Customer: Hi, I've been staring at my computer screen for hours, and it's giving me the silent treatment. I think it's mad at me.
Support Rep: Oh no, we can't have that! Let's try to make peace with your computer. What seems to be the issue? 
Customer: Well, it's just sitting there, not doing anything. I've tried talking to it nicely, but no response. 
Support Rep: Hmmm, have you tried sweet-talking it in binary? Sometimes computers are just shy in human language. 
Customer: Binary? Like 0101010101? Are you serious? 
Support Rep: Absolutely! Give it a shot. Tell it you appreciate its 01010101110 processing power, and you might see some sparks flying. 
Customer: (Laughs) Okay, here goes nothing. "Hey there, computer, you've got the best 0101010101 processing power in town. I love your sleek design, too!" 
Support Rep: Good effort! Now, let's get back to reality. Have you tried turning it off and on again? 
Customer: Oh, that's the oldest trick in the book. But sure, let me give it a whirl. (Pauses) Hey, it's actually working now! What kind of magic did you just perform? 
Support Rep: Ah, the ancient art of "rebootus maximus." Works like a charm every time. Computers sometimes just need a little nap to refresh themselves. 
Customer: (Laughs) Well, you're my hero today! Thanks for saving me from the silent treatment of my computer. I owe you one. 
Support Rep: No problem at all! Just remember, when in doubt, give it a binary compliment and hit that restart button. Anything else I can help you with? 
Customer: Nope, I think my computer and I are on good terms now. Thanks again for the laughs and the tech wizardry! 
Support Rep: Happy to help. If you ever need more binary poetry or tech support, you know where to find me. Have a great day!]' as support_chat
        from
            dual
    );


-- sqlcl_snapshot {"hash":"01d6fd008a9b6b70f33c5cdf3c575b8760defdd3","type":"VIEW","name":"V_CUSTOMER_SUPPORT","schemaName":"MOVIESTREAM","sxml":""}