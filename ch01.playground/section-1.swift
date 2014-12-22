import Foundation

// Challenge 10 – Bloginator (use Xcode6-Beta6)

/**
R1 – Create a constant array of String literals called “types” with the
values: technology, memes, cat videos
**/
// implement code for R1 below
let types = ["technology", "memes", "cat videos"]


/**
R2 – Create a BlogPost class with the following properties:

1. type – String, constant. A random value from the types
array. (Hint: you can use arc4random_uniform to randomly select a value.)
2. views – Optional Int. Set to nil.
3. author – String
4. email – String
5. order – Int. Set to zero.

Create an initializer to set the author’s name (the author property) and email property. Create a “teaser”
method that returns a String with the author’s name and number of views:
“Mike Smith has 5 views for this blog post”. If views are nil,
return “No one has read your blog post yet. Pity.”.
**/
// implement code for R2 below
class BlogPost {
    // properties
    let type = types[Int(arc4random_uniform(UInt32(types.count)))]
    var views: Int? = nil
    var author: String
    var email: String
    var order: Int? = nil
    
    // initalizer
    init(iName:String, iEmail:String) {
        self.author = iName
        self.email = iEmail
    }
    
    // method that return string
    func teaser()->String {
        if (views == 0) {
            return "No one has read your blog post yet. Pity."
        } else {
            return "Mike Smith has \(views) views for this blog post"
        }
    }
}



/**
R3 – Create a “randomAuthor” function that returns a tuple. Then create
an “Author” struct with a “name” and “email” property. Add 5 Author structs
to a dictionary using the author’s name as the key. This function returns
a randomly selected name and email of an Author from the dictionary.
**/
// implement code for R3 below
func randomAuthor()->(String, String) {
    // struct author
    struct Author {
        var name: String
        var email: String
    }
    
    // create author with struct construction
    var firstAuth = Author(name: "Orang Pertama", email: "satu@gmail.com")
    var secondAuth = Author(name: "Orang Kedua", email: "dua@gmail.com")
    var thirdAuth = Author(name: "Orang Ketiga", email: "tiga@gmail.com")
    var forthAuth = Author(name: "Orang Keempat", email: "empat@gmail.com")
    var fiftAuth = Author(name: "Orang Kelima", email: "lima@gmail.com")
    
    // create dictionary for storing author
    var dictAuthors = Dictionary<String, Author>()
    
    // create elements of dictionary
    dictAuthors[firstAuth.name] = firstAuth
    dictAuthors[secondAuth.name] = secondAuth
    dictAuthors[thirdAuth.name] = thirdAuth
    dictAuthors[forthAuth.name] = forthAuth
    dictAuthors[fiftAuth.name] = fiftAuth
    
    
    var selectedAuth = dictAuthors.values.array[Int(arc4random_uniform(UInt32(dictAuthors.count)))]
    return (selectedAuth.name, selectedAuth.email)
}


/**
R4 – Create an array of 10 blog posts with a for loop. Set the “author”
property to the value returned from “randomAuthor” function and set
the “order” property to the value of the index of the for loop used to
populate this array.
**/
// implement code for R4 below

var arrBlogPost = Array<BlogPost>()

for i in 0...9 {
    
    // fetch from randomAuthor() func and give to item
    let randValue = randomAuthor()
    var itemBlogPost = BlogPost(iName: randValue.0, iEmail: randValue.1)
    
    // order as loop index
    itemBlogPost.order = i
    
    // add to array blogPost
    arrBlogPost.append(itemBlogPost)
}



/**
R5 – Create a “randomViews” function that accepts the “type” of blog post
for an input. Create an array literal of Ints (these are the possible view
counts) with the values: 10, 20, 30, 40, 50. Select a random value from
this possible view count array and create a switch that returns nil if
the views are 10, 0 if the views are either 20 or 30, else return the randomly
selected number of views. If the “type” passed to the function is
“cat videos” always return nil.
**/
// implement code for R5 below
func randomViews(type: String)->(Int?) {
    
    let ints = [10, 20, 30, 40, 50]
    
    //  get random value from ints
    var randInts = ints[Int(arc4random_uniform(UInt32(ints.count)))]
    
    switch(randInts){
    case 10:
        return nil;
    case 20, 30:
        return 0;
    default:
        return randInts;
    }
    
    if (type=="cat videos"){
        return nil
    }
}



/**
R6 – Iterate the array of blog posts, generate a value from “randomViews” function
for each one and set it to the blog post “views” property. Then println the
value of each post.teaser().
**/
// implement code for R6 below



/**
R7 – Write a simple stack using a struct with Generics
that has three methods. It should push and pop BlogPosts and also
returns the current count of BlogPosts. Iterate the array of blog posts
and push each one onto the “blogs” stack. Println the count of items in
the stack. Use a for loop to iterate the “blogs” stack, pop the top one
off and println the blog’s teaser. Println the count of items in the stack.
**/
// implement code for R7 below