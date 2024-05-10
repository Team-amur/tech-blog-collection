create schema if not exists tech_blog_web;

use tech_blog_web;

create table if not exists Blog_Collection
(
    blog_collection_id int         not null
        primary key,
    title              varchar(45) null,
    url                varchar(45) null,
    regist_time        varchar(45) null,
    update_time        varchar(45) null,
    company_name       varchar(45) null,
    category           varchar(45) null,
    read_count         varchar(45) null,
    like_count         varchar(45) null,
    gpt_summary        varchar(45) null
);

create table if not exists Member
(
    member_id    varchar(20) not null
        primary key,
    password     varchar(45) null,
    name         varchar(45) null,
    email        varchar(45) null,
    phone_number varchar(45) null,
    member_level varchar(45) null,
    regist_time  varchar(45) null,
    update_time  varchar(45) null,
    nickname     varchar(45) null,
    provide      varchar(45) null,
    gender       varchar(45) null,
    constraint member_id_UNIQUE
        unique (member_id)
);

create table if not exists Board
(
    board_id    int         not null,
    title       varchar(45) null,
    member_id   varchar(20) not null,
    content     varchar(45) null,
    like_count  varchar(45) null,
    read_count  varchar(45) null,
    regist_time varchar(45) null,
    update_time varchar(45) null,
    type        varchar(45) null,
    primary key (board_id, member_id),
    constraint fk_Board_Member
        foreign key (member_id) references Member (member_id)
            on update cascade on delete cascade
);

create index fk_Board_Member_idx
    on Board (member_id);

create table if not exists Comment
(
    id                int         not null,
    content           varchar(45) null,
    board_id          int         not null,
    member_id         varchar(20) not null,
    regist_time       varchar(45) null,
    update_time       varchar(45) null,
    depth             varchar(45) null,
    mother_comment_id varchar(45) null,
    comment_seq       varchar(45) null,
    primary key (id, board_id, member_id),
    constraint fk_Comment_Board1
        foreign key (board_id) references Board (board_id)
            on update cascade on delete cascade,
    constraint fk_Comment_Member1
        foreign key (member_id) references Member (member_id)
            on update cascade on delete cascade
);

create index fk_Comment_Board1_idx
    on Comment (board_id);

create index fk_Comment_Member1_idx
    on Comment (member_id);

create table if not exists Favorite_Blog
(
    favorite_blog_id                  int         not null,
    member_id                         varchar(45) not null,
    blog_collection_id                int         not null,
    regist_time                       varchar(45) null,
    update_time                       varchar(45) null,
    member_to_favorite_blog_member_id varchar(20) not null,
    primary key (favorite_blog_id, member_to_favorite_blog_member_id, member_id, blog_collection_id),
    constraint fk_Favorite_Blog_Blog_Collection1
        foreign key (blog_collection_id) references Blog_Collection (blog_collection_id)
            on update cascade on delete cascade,
    constraint fk_Favorite_Blog_Member1
        foreign key (member_id) references Member (member_id)
            on update cascade on delete cascade
);

create index fk_Favorite_Blog_Blog_Collection1_idx
    on Favorite_Blog (blog_collection_id);

create index fk_Favorite_Blog_Member1_idx
    on Favorite_Blog (member_id);

create table if not exists Favorite_Blog_List
(
    favorite_blog_list_id int         not null,
    member_id             varchar(20) not null,
    regist_time           varchar(45) null,
    title                 varchar(45) null,
    update_time           varchar(45) null,
    primary key (favorite_blog_list_id, member_id),
    constraint favorite_blog_list_UNIQUE
        unique (favorite_blog_list_id),
    constraint fk_Favorite_Blog_List_Member1
        foreign key (member_id) references Member (member_id)
            on update cascade on delete cascade
);

create index fk_Favorite_Blog_List_Member1_idx
    on Favorite_Blog_List (member_id);

create table if not exists list_to_blog
(
    favorite_blog_list_id int not null,
    favorite_blog_id      int not null,
    primary key (favorite_blog_list_id, favorite_blog_id),
    constraint fk_list_to_blog_Favorite_Blog1
        foreign key (favorite_blog_id) references Favorite_Blog (favorite_blog_id),
    constraint fk_list_to_blog_Favorite_Blog_List1
        foreign key (favorite_blog_list_id) references Favorite_Blog_List (favorite_blog_list_id)
            on update cascade on delete cascade
);

create index fk_list_to_blog_Favorite_Blog1_idx
    on list_to_blog (favorite_blog_id);
