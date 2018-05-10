//*********************************************************\\
// Program     : lab1_5.c
// Date        : Wed Feb 11, 2009
// Class       : CIS636 Computer Graphics
// Description : 3D Shapes:
// Prof.       : William Hsu
// Student     : Juan Torres
// Tools       : Windows Vista
//               VMware Player 
//               Ubuntu Network/Virtual Appliance
//               OpenGL(MESA) for Linux
//**********************************************************\\

#include </usr/include/GL/gl.h>            // header file for the OpenGL32 library
#include </usr/include/GL/glu.h>           // header file for the GLu32 library
#include </usr/include/GL/glut.h>          // header file for the GLut library


#define kWindowWidth    400
#define kWindowHeight   300


GLvoid InitGL(GLvoid)
{
   glClearColor(GL_RED, GL_GREEN, GL_BLUE, GL_ALPHA);
}

GLvoid DrawGLScene(GLvoid)
{
   
   glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);   // clear the screen and the depth buffer
   glLoadIdentity();                                     // reset the view

   // YOUR RENDERING CODE GOES HERE
   //**************************************************************
   glTranslatef(-1.5f,0.0f,-6.0f);				// Move Left And Into The Screen

	glRotatef(rtri,0.0f,1.0f,0.0f);				// Rotate The Pyramid On It's Y Axis

	glBegin(GL_TRIANGLES);					// Start Drawing The Pyramid

                glColor3f(1.0f,0.0f,0.0f);			// Red
		glVertex3f( 0.0f, 1.0f, 0.0f);			// Top Of Triangle (Front)
		glColor3f(0.0f,1.0f,0.0f);			// Green
		glVertex3f(-1.0f,-1.0f, 1.0f);			// Left Of Triangle (Front)
		glColor3f(0.0f,0.0f,1.0f);			// Blue
		glVertex3f( 1.0f,-1.0f, 1.0f);			// Right Of Triangle (Front)

                glColor3f(1.0f,0.0f,0.0f);			// Red
		glVertex3f( 0.0f, 1.0f, 0.0f);			// Top Of Triangle (Right)
		glColor3f(0.0f,0.0f,1.0f);			// Blue
		glVertex3f( 1.0f,-1.0f, 1.0f);			// Left Of Triangle (Right)
		glColor3f(0.0f,1.0f,0.0f);			// Green
		glVertex3f( 1.0f,-1.0f, -1.0f);			// Right Of Triangle (Right)


	        glColor3f(1.0f,0.0f,0.0f);			// Red
		glVertex3f( 0.0f, 1.0f, 0.0f);			// Top Of Triangle (Back)
		glColor3f(0.0f,1.0f,0.0f);			// Green
		glVertex3f( 1.0f,-1.0f, -1.0f);			// Left Of Triangle (Back)
		glColor3f(0.0f,0.0f,1.0f);			// Blue
		glVertex3f(-1.0f,-1.0f, -1.0f);			// Right Of Triangle (Back)


                glColor3f(1.0f,0.0f,0.0f);			// Red
		glVertex3f( 0.0f, 1.0f, 0.0f);			// Top Of Triangle (Left)
		glColor3f(0.0f,0.0f,1.0f);			// Blue
		glVertex3f(-1.0f,-1.0f,-1.0f);			// Left Of Triangle (Left)
		glColor3f(0.0f,1.0f,0.0f);			// Green
		glVertex3f(-1.0f,-1.0f, 1.0f);			// Right Of Triangle (Left)
	glEnd();						// Done Drawing The Pyramid


	glLoadIdentity();
	glTranslatef(1.5f,0.0f,-7.0f);				// Move Right And Into The Screen

	glRotatef(rquad,1.0f,1.0f,1.0f);			// Rotate The Cube On X, Y & Z

	glBegin(GL_QUADS);					// Start Drawing The Cube

	        glColor3f(0.0f,1.0f,0.0f);		        // Set The Color To Green
		glVertex3f( 1.0f, 1.0f,-1.0f);			// Top Right Of The Quad (Top)
		glVertex3f(-1.0f, 1.0f,-1.0f);			// Top Left Of The Quad (Top)
		glVertex3f(-1.0f, 1.0f, 1.0f);			// Bottom Left Of The Quad (Top)
		glVertex3f( 1.0f, 1.0f, 1.0f);			// Bottom Right Of The Quad (Top)


                glColor3f(1.0f,0.5f,0.0f);			// Set The Color To Orange
		glVertex3f( 1.0f,-1.0f, 1.0f);			// Top Right Of The Quad (Bottom)
		glVertex3f(-1.0f,-1.0f, 1.0f);			// Top Left Of The Quad (Bottom)
		glVertex3f(-1.0f,-1.0f,-1.0f);			// Bottom Left Of The Quad (Bottom)
		glVertex3f( 1.0f,-1.0f,-1.0f);			// Bottom Right Of The Quad (Bottom)


                glColor3f(1.0f,0.0f,0.0f);			// Set The Color To Red
		glVertex3f( 1.0f, 1.0f, 1.0f);			// Top Right Of The Quad (Front)
		glVertex3f(-1.0f, 1.0f, 1.0f);			// Top Left Of The Quad (Front)
		glVertex3f(-1.0f,-1.0f, 1.0f);			// Bottom Left Of The Quad (Front)
		glVertex3f( 1.0f,-1.0f, 1.0f);			// Bottom Right Of The Quad (Front)


                glColor3f(1.0f,1.0f,0.0f);			// Set The Color To Yellow
		glVertex3f( 1.0f,-1.0f,-1.0f);			// Bottom Left Of The Quad (Back)
		glVertex3f(-1.0f,-1.0f,-1.0f);			// Bottom Right Of The Quad (Back)
		glVertex3f(-1.0f, 1.0f,-1.0f);			// Top Right Of The Quad (Back)
		glVertex3f( 1.0f, 1.0f,-1.0f);			// Top Left Of The Quad (Back)

                glColor3f(0.0f,0.0f,1.0f);			// Set The Color To Blue
		glVertex3f(-1.0f, 1.0f, 1.0f);			// Top Right Of The Quad (Left)
		glVertex3f(-1.0f, 1.0f,-1.0f);			// Top Left Of The Quad (Left)
		glVertex3f(-1.0f,-1.0f,-1.0f);			// Bottom Left Of The Quad (Left)
		glVertex3f(-1.0f,-1.0f, 1.0f);			// Bottom Right Of The Quad (Left)

                glColor3f(1.0f,0.0f,1.0f);			// Set The Color To Violet
		glVertex3f( 1.0f, 1.0f,-1.0f);			// Top Right Of The Quad (Right)
		glVertex3f( 1.0f, 1.0f, 1.0f);			// Top Left Of The Quad (Right)
		glVertex3f( 1.0f,-1.0f, 1.0f);			// Bottom Left Of The Quad (Right)
		glVertex3f( 1.0f,-1.0f,-1.0f);			// Bottom Right Of The Quad (Right)
	glEnd();						// Done Drawing The Quad
	rtri+=0.2f;						// Increase The Rotation Variable For The Triangle 
	rquad-=0.15f;						// Decrease The Rotation Variable For The Quad 

   //**************************************************************
 
   glLoadIdentity();

   glutSwapBuffers();
   glFlush();
}

GLvoid ReSizeGLScene(int Width, int Height)
{
   glViewport (0, 0, (GLsizei) Width, (GLsizei) Height);
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();

   gluPerspective(90.0, (GLfloat) Width / (GLfloat) Height, 0.1, 100.0);

   glMatrixMode(GL_MODELVIEW);
   glLoadIdentity();
}

int main(int argc, char** argv)
{
   glutInit(&argc, argv);
   glutInitDisplayMode (GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
   glutInitWindowSize (kWindowWidth, kWindowHeight);
   glutInitWindowPosition (100, 100);
   glutCreateWindow (argv[0]);

   InitGL();

   glutDisplayFunc(DrawGLScene);
   glutReshapeFunc(ReSizeGLScene);

   glutMainLoop();

   return 0;
}