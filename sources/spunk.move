module spunk::spunk {
    use sui::url;
    use sui::coin::{Self};

    public struct SPUNK has drop {}

    fun init(witness: SPUNK, ctx: &mut TxContext) {

        let (mut treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"SPUNK",
            b"SPUNK",
            b"The official token of the Sui Punks collection. Don’t fall for the knockoffs – grab your $SPUNK now, because obviously, it’s the real deal.",
            option::some(
                url::new_unsafe(
                    std::ascii::string(
                        b"https://bafybeifaicnh7ae4w6awgp7mbg7i4twd7ab2vsgk2gkhic2zyr5ijjgv4m.ipfs.w3s.link/%24SPUNK-WBG.png"
                    )
                )
            ),
            ctx
        );


        coin::mint_and_transfer(&mut treasury, 1000000000000000, tx_context::sender(ctx), ctx);
        transfer::public_transfer(treasury, @0x0);
        transfer::public_share_object(metadata);
    }




}
