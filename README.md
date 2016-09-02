**Directory**
==========
**Level 3**

Directory is a wiki-style app based on the characters from the show Game Of Thrones. Students will review proper MVC principles, parsing JSON from a local level to build an app that details all character information. 

Students who complete this project are able to:

 - parse JSON data to generate model objects. 
 - use NSNotifications to communicate between different classes.
 - access local files through NSBundle.
 - build custom collection views
 - use Delegate Flow Layout to configure UICollectionView.


**Getting Started**

Fork this repo and make a branch from the initial commit. Open the project and review the `thrones.json` file for what information what properties you will need to include in your model. 

**Implement you Model**

*Carefully consider what models you will need? Whether you should use a class or a struct? What type of initializer you should use?*

 1. Create a `Character.swift` file.
 2. Using the information from the JSON file, add the all properties that make up a character object. Example:
	- `let name: String`
	- `let id: String`
	- `let titles: [String]`
 3.  Knowing that we will be getting our values out of a JSON Dictionary, we will need to use keys to access those values. Go through and make private keys for all of the properties. 
 4. Create an extension on `Character` and create your failable initializer that takes a dictionary as a parameter. Initialize all 15 of your properties. 

**Model Controller**

Create a model controller that will manage the parsing of the JSON and storing your model objects. Use NSNotifiation to notify the view when it should update. . 
> *Consider the following:* 
> *Is a singleton necessary here? Why or why not?*
>  *What are the differences between a delegate and an NSNotification?*

1. Add a `charactersArray` property told store all character objects. Make the array setable only from within the scope of `CharacterController`, thus making it a readonly property to all other structs of classes. 
2. Add a property observer to the `charactersArray` so that every time the property gets set it will post an NSNotification. 
3. Create the notification `CharactersDidChangeNotification`. Post the notification from inside the property observer on the `charactersArray`.
4. Create a `getCharacters()` function that will handle all of the JSON parsing. Access the `thrones.json` file by getting the file path for it through the `mainBundle`.  Initialize all the character objects and store them in the `charactersArray`.
5. Call `getCharacters()` from inside of the initializer.

**Set Up Views**

Directory follows a Master-Detail style design. Implement the Master Character Collection View and then the Character Detail View

**Master View**

1. In storyboard drag out a UICollectionViewController and embed it in a Navigation Controller. 
2. Add two labels to the CollectionViewCell, one for ID and for Name. 
3. Create the `CharacterCollectionViewController` and `CharacterCollectionViewCell` files and subclass your views accordingly. 
4. Create an outlet from the flowLayout (hint: You'll find it in your view hierarchy). Read documentation to see what you can do with the UICollectionViewDelegateFlowLayout.
5. Implement the DataSource methods, and the DelegateFlowLayout method `collectionViewLayout:sizeForItemAtIndexPath.`
6. In the `viewDidLoad` add an observer for the NSNotifcation `CharactersDidChangeNotification` that will reload the collection view when the characters have successfully been parsed. 

**Character Cell**

1. Make your outlets to the collectionViewCell.
2. Create a function called `updateWithCharacter(character: Character)` that will set the view accordingly to the current character. If a character doesn't have a name, set the label with their first alias. 
3. Create a function that will give the cell a border and rounded corners.
4. In the `CharacterCollectionViewController`, set the cell to be a custom character cell. 

**Character Detail View**

The detail view will display all of the information about a selected character that we will receive through our segue from the master list view. 


1. In storyboard, drag out a UIViewController and segue to it from the collection view cell.
2. Create a `CharacterDetailViewController.swift` file and subclass your view. 
3. Set a label on the view to display each of the properties of a character. 
4. Connect your outlets.
5. Create a function that will take in a character and update the view/outlets with all of the properties of a character. 
6. Try and unwrap the `character` property, and then call the update function and pass in the unwrapped character. 

**Implementing Segue**

>*Consider these questions when preparing your segue:*
>*Where am I going? How am I getting there? What do I need to pass, and where is it currently? Did I successfully pass it?*

1. Check to make sure that you are segueing with the right identifier.
2. Identify your destinationViewController, where you want your information to be passed to. 
3. Using the sender parameter given to you by the function, get the selected cell and then the indexPath. Using the indexPath, get the correct character that has has been selected and assign it to the detailViewController's `character` property. 

